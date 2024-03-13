import agora_extension

class Agora:
    def __init__(self, app_id, channel_id, user_id):
        self.channel_sender =  agora_extension.AgoraChannelSender(app_id, channel_id, user_id)

    def listen(self, audio_file, sample_rate, num_of_channels):
        return self.channel_sender.listen(audio_file, sample_rate, num_of_channels)

    def send(self, content: str):
        return self.channel_sender.send_string(content)