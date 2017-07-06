default[:private_internet_access][:location] = 'Sweden'

# We support connections on a variety of ports, TCP 80/443/110,
# as well as a number of UDP ports: 53, 1194, 8080, 9201
# 1194 UDP is default
default[:private_internet_access][:port] = '443'
default[:private_internet_access][:proto] = 'tcp-client'

default[:private_internet_access][:locations] = {
  'Australia' => 'aus',
  'CA_North_York' => 'ca',
  'CA_Toronto' => 'ca-toronto',
  'France' => 'france',
  'Germany' => 'germany',
  'Hong_Kong' => 'hk',
  'Israel' => 'israel',
  'Japan' => 'japan',
  'Netherlands' => 'nl',
  'Romania' => 'ro',
  'Sweden' => 'sweden',
  'Switzerland' => 'swiss',
  'UK_London' => 'uk-london',
  'UK_Southampton' => 'uk-southampton',
  'US_California' => 'us-california',
  'US_East' => 'us-east',
  'US_Florida' => 'us-florida',
  'US_Midwest' => 'us-midwest',
  'US_Seattle' => 'us-seattle',
  'US_Texas' => 'us-texas',
  'US_West' => 'us-west',
}
