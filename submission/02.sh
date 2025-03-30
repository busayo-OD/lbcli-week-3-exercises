# Create a native segwit address and get the public key from the address.

# Generate a native SegWit (Bech32) address
ADDRESS=$(bitcoin-cli -regtest getnewaddress "" bech32)

# Get the public key associated with the address
PUBKEY=$(bitcoin-cli -regtest getaddressinfo "$ADDRESS" | jq -r '.pubkey')

# Output results
echo "$ADDRESS"
echo "$PUBKEY"
