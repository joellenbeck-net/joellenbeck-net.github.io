Bundler.require(:default)

class TLDR
  def teardown
    super
    Mocktail.reset
  end
end

loader = Zeitwerk::Loader.new
loader.push_dir("#{__dir__}/../lib")
loader.setup
