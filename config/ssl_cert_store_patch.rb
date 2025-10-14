# frozen_string_literal: true

require "openssl"

# Populate Ruby's default SSL certificate store with system CA paths so
# Net::HTTP can verify HTTPS connections even when the runtime was built
# without bundling certs.
store = OpenSSL::X509::Store.new
store.set_default_paths
OpenSSL::SSL::SSLContext::DEFAULT_PARAMS[:cert_store] = store
