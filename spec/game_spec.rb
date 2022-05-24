require './game'

describe Game do
  before(:each) do
    @game = Game.new(12, '2022/2/3', 'anything', '2022/5/3')
  end

  it 'should be an instance of Game' do
    expect(@game).to be_an_instance_of(Game)
  end

  it 'should have specific id' do
    expect(@game.id).not_to eq(15)
  end
end
