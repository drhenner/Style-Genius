var Hadean = window.Hadean || {};

// If we already have the Admin namespace don't override
if (typeof Hadean.Quiz == "undefined") {
    Hadean.Quiz = {};
}
var gg = null;
var waitingForAdd = null;
// If we already have the purchaseOrder object don't override
if (typeof Hadean.Quiz.question == "undefined") {

    Hadean.Quiz.question = {
        //test    : null,
        initialize      : function( ) {
          jQuery('.answer-radio-button').live('click', function(){
            jQuery(this).addClass('selected');
            var answerId = jQuery(this).data('answer_id');
            Hadean.Quiz.question.selectAnswer(answerId);
          });

        },
        selectAnswer : function(answerId) {
          //  Prevent double clicking...
          if ( waitingForAdd != null ) {
            // THIS IS A DOUBLE CLICK!
          } else {
            waitingForAdd = answerId;

            jQuery.ajax({
              type : "POST",
              url: "/quizes/get_started/questions",
              data: { answer_id: answerId },
              success: function(jsonText){
                Hadean.Quiz.question.nextQuestion();
              },
              dataType: 'json'
            });
          }
        },
        nextQuestion : function() {
          //window.open(featuredProduct.data('external_link'));
          window.location = '/quizes/get_started/questions/none';
        }
    };

    jQuery(function() {
      Hadean.Quiz.question.initialize();
    });
}