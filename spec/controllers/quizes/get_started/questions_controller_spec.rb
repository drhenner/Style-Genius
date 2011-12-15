require File.dirname(__FILE__) + '/../spec_helper'

describe Quizes::GetStarted::QuestionsController do
  # fixtures :all
  render_views

  it "index action should render index template" do
    question = Factory(:question)
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    question = Factory(:question)
    get :show, :id => question.id
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    question = Factory.build(:question)
    Question.any_instance.stubs(:valid?).returns(false)
    post :create, :question => { question.attributes }
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    question = Factory.build(:question)
    Question.any_instance.stubs(:valid?).returns(true)
    post :create, :question => { question.attributes }
    response.should redirect_to(quizes_get_started_question_url(assigns[:question]))
  end

  it "edit action should render edit template" do
    question = Factory(:question)
    get :edit, :id => question.id
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    question = Factory(:question)
    Question.any_instance.stubs(:valid?).returns(false)
    put :update, :id => question.id, :question => { question.attributes }
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    question = Factory(:question)
    Question.any_instance.stubs(:valid?).returns(true)
    put :update, :id => question.id, :question => { question.attributes }
    response.should redirect_to(quizes_get_started_question_url(assigns[:question]))
  end
end
