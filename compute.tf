module "cluster_resourece" {
    source = "./ekscluster"

    cluster-name   = "myNewCluster"
    region         = "us-east-1" 
    instance-types = [ "t2.micro" ] 
    desired_size   = 1
    max_size       = 2
    min_size       = 1
    max_unaval     = 1
    cidr_block     = "10.0.0.0/16"
    dns_enable     = true
    dns_host       = true

}

module "dev_vm" {
    source = "./ubuntu_vm"

    region = "us-east-1"
    encrypted = true
    bucket_name = "truthbucket9846575"
    #acl         = "public-read-write"
    tag_name = "samplebucket"


}