from src.RtcTokenBuilder2 import RtcTokenBuilder, Role_Publisher, time

appId = "8cdab228e3d540159c39602958250c9c"
appCertificate = "7e16fb67e1c24604ba2f6f80a6211527"
channelName = "LiveChannel"
uid = 1234  # The integer uid, required for an <Vg k="VSDK" /> token
expirationTimeInSeconds = 3600  # The time after which the token expires


def generate_token():
    #  Calculate the time expiry timestamp
    current_timestamp = int(time.time())
    expired_ts = current_timestamp + expirationTimeInSeconds

    print("UID token:")
    token = RtcTokenBuilder.build_token_with_uid(appId, appCertificate, channelName, uid, Role_Publisher, token_expire=expired_ts, privilege_expire=expired_ts)
    print(token)

generate_token()
