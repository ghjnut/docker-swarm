target_group "cloud" {
  prefix = "cloud"

  target "ec2.us-east-1" {
    address = "ec2.us-east-1.amazonaws.com"
  }
  target "ec2.us-east-2" {
    address = "ec2.us-east-2.amazonaws.com"
  }
  target "ec2.us-west-1" {
    address = "ec2.us-west-1.amazonaws.com"
  }
  target "ec2.us-west-2" {
    address = "ec2.us-west-2.amazonaws.com"
  }
  target "gce.us-central1" {
    address = "us-central1-gce.cloudharmony.net"
  }
  target "gce.us-east1" {
    address = "us-east1-gce.cloudharmony.net"
  }
  target "gce.us-east4" {
    address = "us-east4-gce.cloudharmony.net"
  }
  target "gce.us-west1" {
    address = "us-west1-gce.cloudharmony.net"
  }
  target "gce.us-west2-a" {
    address = "us-west2-a-gce.cloudharmony.net"
  }
}

# Declare a target group with a name
target_group "websites" {
  # a custom ping interval for this group
  # A prefix for the statsd metric for this group
  prefix = "websites"
  # A name for the target. This becomes the statsd metric
  target "youtube" {
    address = "youtube.com"
  }
  target "jupiter_broadcasting" {
    address = "jupiterbroadcasting.com"
  }
  target "twitch" {
    address = "twitch.tv"
  }
}

# You can specify multiple target groups
target_group "games" {
  prefix = "games"

  target "dota_west" {
    address = "192.69.96.1"
  }
  target "dota_east" {
    address = "208.78.164.1"
  }
  target "rocketleague.na" {
    address = "104.160.131.3"
  }
  target "rocketleague.euw" {
    address = "104.160.141.3"
  }
  target "rocketleague.eune" {
    address = "104.160.142.3"
  }
  target "rocketleague.oce" {
    address = "104.160.156.1"
  }
  target "rocketleague.sea" {
    address = "104.160.136.3"
  }
  # all cloudflare
  #target "rocket_league_na" {
  #  address = "104.160.131.3"
  #}
  #target "pubg_west" {
  #  address = "104.160.131.3"
  #}
  #target "pubg_east" {
  #  address = "104.160.156.1"
  #}
}

target_group "dns" {
  prefix = "dns"

  target "google_1" {
    address = "8.8.8.8"
  }
  target "google_2" {
    address = "8.8.4.4"
  }
  target "opendns_1" {
    address = "208.67.222.222"
  }
  target "opendns_2" {
    address = "208.67.220.220"
  }
  target "cloudflare" {
    address = "1.1.1.1"
  }
}

target_group "hops" {
  prefix = "hops"

  target "switch" {
    address = "192.168.1.6"
  }
  target "gateway" {
    address = "192.168.1.1"
  }
  target "ap" {
    address = "192.168.1.7"
  }
  target "derek" {
    address = "192.168.1.10"
  }
  target "hop_1" {
    address = "hlrn-dsl-gw06.hlrn.qwest.net"
  }
  target "hop_2" {
    address = "63-225-124-41.hlrn.qwest.net"
  }
}
