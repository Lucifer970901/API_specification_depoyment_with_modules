compartment_id = "ocid1.compartment.oc1..aaaaaaaaukottugsmj5vmneywbzvecjbg5pew2b7clgnm53zwyvgdutdiwvq"
### Region
region="us-ashburn-1"
subnet_id = "ocid1.subnet.oc1.iad.aaaaaaaaxi67xath5e6e57ffg5ilwbqoxdaiicgu7zorpcwz6bozi2bb6haa"

#function_id = "ocid1.fnapp.oc1.iad.aaaaaaaauzrzzzd7kgciojbqxophdhrnonl3atjdymn4zygmcj4iehhwdvqa"
function_ids  = {
  helloworld-func = "" 
}
gwdeploy_params = {
   api_deploy1 = {
  function_routes = [
      {
        type          = "function"
        #path          = "/func"
        #methods       = ["GET", ]
        function_name = "helloworld-func"
      }
    ]
}
}
