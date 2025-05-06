locals {
  vnet_subscription = var.env == "stg" ? "nonprod" : "prod"

  subscriptions = {

    nonprod = {
      subscription = "b44eb479-9ae2-42e7-9c63-f3c599719b6f"
    }
    prod = {
      subscription = "2b1afc19-5ca9-4796-a56f-574a58670244"
    }
  }

}
