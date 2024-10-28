import requests
import base64
import json


HOST = "http://127.0.0.1:9300"


def url2base64(url):
    base64_data = base64.b64encode(requests.get(url).content).decode("utf-8")
    return f"data:image/png;base64,{base64_data}"


def post_image(base64_image):

    url = f"{HOST}/mj/submit/imagine"

    data = {
        "base64Array": [base64_image],
        "prompt": "dog",
    }
    headers = {"Content-Type": "application/json"}
    response = requests.post(url, data=json.dumps(data), headers=headers)
    return response.json()


if __name__ == "__main__":
    url = "https://cdn.discordapp.com/icons/1126063827537100880/eca3c05af92b55aea36c718d034c3f82.webp?size=96"
    base64_image = url2base64(url)
    # print(base64_image)
    print(post_image(base64_image))
