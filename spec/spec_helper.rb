require 'monads/monad'
Dir["#{File.dirname __FILE__}/../lib/monads/*.rb"].each { |file| require "monads/#{File.basename file, '.rb'}" }
