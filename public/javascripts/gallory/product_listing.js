var Hadean = window.Hadean || {};

// If we already have the Admin namespace don't override
if (typeof Hadean.Gallory == "undefined") {
    Hadean.Gallory = {};
}
var gg = null;
var waitingForAdd = null;
// If we already have the purchaseOrder object don't override
if (typeof Hadean.Gallory.productListing == "undefined") {

    Hadean.Gallory.productListing = {
        //test    : null,
        initialize      : function( ) {
          jQuery('.product-listing-item').bind('click', function(){
            Hadean.Gallory.productListing.changeFeaturedProduct(this);
          });
          jQuery('.buy-now').live('click', function(){
            Hadean.Gallory.productListing.buyNow();
          });
          jQuery('.add-to-showroom').live('click', function(){

            featuredProduct = jQuery('#featured_gallory_product');

            Hadean.Gallory.productListing.addToShowroom(featuredProduct.data('product_id'));
          });

          jQuery('.remove-from-showroom').live('click', function(){
            Hadean.Gallory.productListing.removeFromShowroom();
          });

        },
        addToShowroom : function(productId) {
          //  Prevent double clicking...
          if ( waitingForAdd == productId ) {
            // THIS IS A DOUBLE CLICK!
          } else {
            waitingForAdd = productId;
            // ajax, on success show remove from Showroom link
            jQuery.ajax({
              type : "POST",
              url: "/gallories/products",
              data: { product_id: productId },
              success: function(jsonText){
                gg = jsonText;
                jQuery('.add-to-showroom').hide();
                jQuery('.remove-from-showroom').fadeIn();
                waitingForAdd = null;

                //jQuery('.product-listing-item').attr("disabled", false);
              },
              dataType: 'json'
            });
          }
        },
        removeFromShowroom : function() {
          // ajax, on success show add to Showroom link
          if ( waitingForAdd == productId ) {
            // THIS IS A DOUBLE CLICK!
          } else {
            waitingForAdd = productId;
            // ajax, on success show remove from Showroom link
            jQuery.ajax({
              type : "DELETE",
              url: "/gallories/products/" + productId,
              data: { product_id: productId },
              success: function(jsonText){
                jQuery('.add-to-showroom').fadeIn();
                jQuery('.remove-from-showroom').hide();
                waitingForAdd = null;

                //jQuery('.product-listing-item').attr("disabled", false);
              },
              dataType: 'json'
            });
          }
        },
        buyNow : function() {
          featuredProduct = jQuery('#featured_gallory_product');
          window.open(featuredProduct.data('external_link'));
        },
        changeFeaturedProduct : function(obj) {
          productId = jQuery(obj).data('product_id')
          jQuery.ajax({
            type : "GET",
            url: "/gallories/products/" + productId,
            success: function(jsonText){
              gg = jsonText;
              featuredImage = jQuery('#featured_gallory_product_image');

              featuredImage.attr("src", jsonText.product.product.featured_product_image);
              featuredImage.attr("alt", jsonText.product.product.name);
              featuredProduct = jQuery('#featured_gallory_product');
              featuredProduct.data('product_id', jsonText.product.product.id);
              featuredProduct.data('external_link', jsonText.product.product.external_link);

              jQuery('#featured_gallery_product_description').html(jsonText.product.product.description)
              if ( jsonText.has_product ) {
                jQuery('.add-to-showroom').hide();
                jQuery('.remove-from-showroom').show();
              } else {
                jQuery('.add-to-showroom').show();
                jQuery('.remove-from-showroom').hide();
              }

              jQuery('.product-listing-item').attr("disabled", false);
            },
            dataType: 'json'
          });
        }
    };

    jQuery(function() {
      Hadean.Gallory.productListing.initialize();
    });
}