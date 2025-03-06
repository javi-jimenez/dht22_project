import unittest
from app.sensor import read_sensor

class TestSensor(unittest.TestCase):
    def test_read_sensor(self):
        data = read_sensor()
        self.assertIn("temperature", data)
        self.assertIn("humidity", data)
        self.assertIsInstance(data["temperature"], (float, type(None)))
        self.assertIsInstance(data["humidity"], (float, type(None)))

if __name__ == '__main__':
    unittest.main()
