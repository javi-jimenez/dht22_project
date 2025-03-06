import Adafruit_DHT

SENSOR = Adafruit_DHT.DHT22
PIN = 4

def read_sensor():
    humidity, temperature = Adafruit_DHT.read_retry(SENSOR, PIN)
    return {"temperature": temperature, "humidity": humidity}
