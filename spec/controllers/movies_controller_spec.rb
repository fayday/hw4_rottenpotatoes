require 'spec_helper'

describe MoviesController do
  describe 'find similar movies' do
    fixtures :movies
    before :each do
      @fake = [mock('movie1'), mock('movie2')]  
    end
    it 'should call the model method that performs Movies With Same Director search' do
      Movie.should_receive(:find_all_by_director).with('Exemplary Director').and_return(@fake)
      get :same_director, {:movie_id => 1}
    end
    
    it 'should select the Similar Movies template for rendering' do
      Movie.stub(:find_all_by_director).and_return(@fake)
      get :same_director, {:movie_id => 1}
      response.should render_template('same_director')
    end

    it 'should make Movies With Same Director search results available to that template' do
      Movie.stub(:find_all_by_director).and_return(@fake)
      get :same_director, {:movie_id => 1}
      assigns(:movies).should == @fake
    end
  end
end
