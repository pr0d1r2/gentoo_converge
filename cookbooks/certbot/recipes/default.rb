%w[
  dev-python/pyrfc3339
  dev-python/pythondialog
  dev-python/parsedatetime
  app-crypt/acme
  app-crypt/certbot
  dev-python/zope-component
  dev-python/zope-event
].each do |ebuild|
  gentoo_package_keywords ebuild do
    keywords '~amd64'
  end
end

package 'certbot'
