require 'spec_helper'

describe MoviesController do
  describe 'find similar movies' do
    it 'should call the model method that performs Movies With Same Director search' do
      post :same_director, {:director => 'director'}
    end
    
    it 'should select the Similar Movies template for rendering'
   

    it 'should make Movies With Same Director search results available to that template' 
    
  end
end
