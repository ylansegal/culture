module Celluloid
  module Sync
    @gem_path ||= File.expand_path("../../", __FILE__)
    $LOAD_PATH.push(@gem_path)

    # TODO: This will likely need to be done differently if INSIDE a cut gem.

    puts "Synchronizing Celluloid Culture //"
    `cd #{@gem_path}/culture; git pull`

    require("#{@gem_path}/culture/gems/loader")

    GEM = Celluloid::Gems::SELF unless defined? GEM
    LIB_PATH = File.expand_path("../../lib/#{GEM.split('-').join('/')}", __FILE__)

    if File.exist?(version = "#{LIB_PATH}/version.rb")
      require(version)
    end
  end
end