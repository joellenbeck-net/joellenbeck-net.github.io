require 'mocktail'
require 'zeitwerk'

loader = Zeitwerk::Loader.new
loader.push_dir("#{__dir__}/../lib")
loader.setup

class TLDR
  include Mocktail::DSL

  def teardown
    super
    Mocktail.reset
  end
end
