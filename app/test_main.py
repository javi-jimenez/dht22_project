from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_stream_json():
    response = client.get("/stream/json")
    assert response.status_code == 200


def test_stream_plain():
    response = client.get("/stream/plain")
    assert response.status_code == 200


def test_health_check():
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json() == {"status": "ok", "message": "Service is running"}
