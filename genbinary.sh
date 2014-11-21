#/bin/bash


# this will genrate binary

[[ -d "./EIFGENs" ]] && rm -r ./EIFGENs
# compile then
ec -c_compile -finalize -config source/invoice.ecf 
if [[ $? -eq 0 ]] ; then
# remove binary file 
  [[ -f "./invoice" ]] && rm ./invoice 
# copy binary file 
  [[ -d "./EIFGENs" ]] &&  cp ./EIFGENs/invoice/F_code/invoice .
else
  printf "unable to compile"
fi