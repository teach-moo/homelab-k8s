Title: CrashLoopBackOff Runbook

What it means: Pod is repeatedly crashing and restarting. Kubernetes backs off between retries — caps at 5 minutes. Will retry indefinitely until fixed or deleted.
Investigation steps:

kubectl get pods — confirm CrashLoopBackOff status and restart count
kubectl logs <pod-name> --previous — logs from the crashed container
kubectl describe pod <pod-name> — events showing what Kubernetes observed

If logs unavailable, check these causes in order:

Wrong command in YAML — container exits immediately
Bad config or missing environment variables — app crashes on startup
Missing dependencies — app can't connect to database or another service
Application bug — code throws exception on startup
Out of memory — container hitting memory limit

Fix: Identify cause, edit YAML, kubectl apply -f filename.yaml, verify pod status returns to Running.
