Pod::Spec.new do |spec|
  spec.name         = "EtherscanClient"
  spec.version      = "0.0.1"
  spec.summary      = "Etherscan Api Client"
  spec.description  = <<-DESC
    EtherscanClient is a clean and well written client for the Etherscan API.
                   DESC
  spec.homepage     = "http://dujason.com"
  spec.license      = { :type => "MIT", :file => 'LICENSE' }
  spec.author       = { "Jason Du" => "contact@dujason.ca" }
  spec.source       = { :git => "https://github.com/jsdu/EtherscanClient.git", :tag => "#{spec.version}" }
  spec.source_files = "Client/**/*.{swift}"
  spec.swift_version = "5.0"
  spec.platforms = {
    "ios": "12.0"
  }
end
