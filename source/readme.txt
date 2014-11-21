to recreate invoice.exe:
1. Delete all the EIFGENs files.
2. in the directory of invoice , run the following command
ec14.05 -c_compile -finalize -config invoice.ecf
3. Then if it complaied successfully , run 
cp ./EIFGENs/invoice/F_code/invoice ./invoice.exe

4. run invoice.exe
