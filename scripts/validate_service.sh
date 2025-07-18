#!/bin/bash
echo "Waiting for services to start..."
sleep 60

# Frontend 확인 (포트 3000)
if curl -f -s http://localhost:3000 > /dev/null 2>&1; then
    echo "✅ Frontend is running"
    frontend_ok=true
else
    echo "❌ Frontend failed"
    frontend_ok=false
fi

# Backend 확인 - 포트 리스닝 여부로 판단
if sudo netstat -tlnp | grep :8080 > /dev/null 2>&1; then
    echo "✅ Backend is listening on port 8080"
    backend_ok=true
else
    echo "❌ Backend is not listening on port 8080"
    backend_ok=false
fi

# 결과 확인
if [ "$frontend_ok" = true ] && [ "$backend_ok" = true ]; then
    echo "✅ Application started successfully"
    exit 0
else
    echo "❌ Application failed to start"
    exit 1
fi
