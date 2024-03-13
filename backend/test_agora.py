from time import sleep

from agora import Agora

agora = Agora("f41264d544d0427ba2d47a4f975857ef", "agoratest", "1")
agora.listen("file.pcm", 16000, 1)
try:
    while True:
        input_text = input("Enter text to send (or 'exit' to stop): ")
        if input_text.lower() == 'exit':
            break  # Exit the loop if the user types 'exit'
        print(agora.send(input_text))
except EOFError:
    pass  # Handle the EOF case gracefully