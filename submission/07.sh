# What is the receiver's address in this partially signed transaction?
# transaction=cHNidP8BAHsCAAAAAhuVpgVRdOxkuC7wW2rvw4800OVxl+QCgezYKHtCYN7GAQAAAAD/////HPTH9wFgyf4iQ2xw4DIDP8t9IjCePWDjhqgs8fXvSIcAAAAAAP////8BigIAAAAAAAAWABTHctb5VULhHvEejvx8emmDCtOKBQAAAAAAAAAA


# PSBT input (Partially Signed Bitcoin Transaction)
psbt="cHNidP8BAHsCAAAAAhuVpgVRdOxkuC7wW2rvw4800OVxl+QCgezYKHtCYN7GAQAAAAD/////HPTH9wFgyf4iQ2xw4DIDP8t9IjCePWDjhqgs8fXvSIcAAAAAAP////8BigIAAAAAAAAWABTHctb5VULhHvEejvx8emmDCtOKBQAAAAAAAAAA"

# Decode the PSBT using bitcoin-cli and store the result in a variable
decoded_tx=$(bitcoin-cli -regtest -named decodepsbt psbt=$psbt)

# echo "$decoded_tx"

# Extract the receiver's address using jq (assuming the address is in the "addresses" field)
receiver_address=$(echo "$decoded_tx" | jq -r '.tx.vout[0].scriptPubKey.address')

# Output the receiver's address
echo "$receiver_address"
