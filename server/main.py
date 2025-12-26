from fastapi import FastAPI

app = FastAPI()

# 기본 접속 테스트 (http://127.0.0.1:8000/)
@app.get("/")
def read_root():
    return {"Project": "Good Medicine", "Status": "Server is Running!"}

# 나중에 쓸 건강 체크용 (http://127.0.0.1:8000/health)
@app.get("/health")
def health_check():
    return {"status": "ok"}