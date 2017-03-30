default[:bitcoind] = {
  proxy: '127.0.0.1:9050', # use TOR
  rpcpassword: SecureRandom.hex # use random password as we do not need to connect for now
}
