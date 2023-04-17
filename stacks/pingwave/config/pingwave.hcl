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
  #target "gce.us-central1" {
  #  address = "us-central1-gce.cloudharmony.net"
  #}
  #target "gce.us-east1" {
  #  address = "us-east1-gce.cloudharmony.net"
  #}
  #target "gce.us-east4" {
  #  address = "us-east4-gce.cloudharmony.net"
  #}
  #target "gce.us-west1" {
  #  address = "us-west1-gce.cloudharmony.net"
  #}
  #target "gce.us-west2-a" {
  #  address = "us-west2-a-gce.cloudharmony.net"
  #}
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

# netflix, YTtv, Youtube, Twitch, amazon prime,
target_group "streaming" {
  prefix = "streaming"
  #curl https://api.fast.com/netflix/speedtest/v2?https=true
  target "netflix-chey" {
    address = "ipv4-c001-den001-centurylink-isp.1.oca.nflxvideo.net"
  }
  target "netflix-chey2" {
    address = "ipv4-c002-cys002-centurylink-isp.1.oca.nflxvideo.net"
  }
  target "netflix-highlands" {
    address = "ipv4-c002-den002-centurylink-isp.1.oca.nflxvideo.net"
  }
  target "netflix-highlands2" {
    address = "ipv4-c003-den001-centurylink-isp.1.oca.nflxvideo.net"
  }
  target "netflix-springs" {
    address = "ipv4-c003-cos001-centurylink-isp.1.oca.nflxvideo.net"
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
    address = "10.48.4.13"
  }
  target "gateway" {
    address = "10.48.0.1"
  }
  target "ap-pro" {
    address = "10.48.4.12"
  }
  target "ap-lite" {
    address = "10.48.4.11"
  }
  target "derek" {
    address = "10.48.0.6"
  }
  target "hop_1" {
    address = "hlrn-dsl-gw12.hlrn.qwest.net"
  }
  target "hop_2" {
    address = "63-225-124-89.hlrn.qwest.net"
  }
}
