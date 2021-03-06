function sqs_redrive
  set queue_name "$argv[1]"
  ~/.virtualenvs/platform/bin/python ~/repos/dockerfiles/sqs_redrive/redrive.py \
    --src="https://sqs.eu-west-1.amazonaws.com/760097843905/"$queue_name"_dlq" \
    --dst="https://sqs.eu-west-1.amazonaws.com/760097843905/"$queue_name
end


# Uses Keybase to decrypt a string encrypted with my PGP key.
#
# This adds the necessary PGP headers, which saves me a small amount
# of hassle each time.
#
function keybase_decrypt
  pushd (mktemp -d)
    echo "-----BEGIN PGP MESSAGE-----"  > encrypted.txt
    echo ""                            >> encrypted.txt
    pbpaste                            >> encrypted.txt
    echo "-----END PGP MESSAGE-----"   >> encrypted.txt

    keybase decrypt -i encrypted.txt
  popd
end
