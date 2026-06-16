import { auth } from "@/lib/auth";
import { toNextJsHandler } from "better-auth/next-js";

const handlers = toNextJsHandler(auth);

// Credentialed cross-origin requests (e.g. Flutter Web served from a different
// origin than this server) require CORS headers: a SPECIFIC origin (not "*")
// plus allow-credentials, and a preflight (OPTIONS) handler.
function withCors(res: Response, origin: string | null): Response {
  const headers = new Headers(res.headers);
  headers.set("Access-Control-Allow-Origin", origin ?? "*");
  headers.set("Access-Control-Allow-Credentials", "true");
  headers.set("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
  headers.set(
    "Access-Control-Allow-Headers",
    "Content-Type, Authorization, Cookie, expo-origin, x-skip-oauth-proxy",
  );
  headers.set("Vary", "Origin");
  return new Response(res.body, {
    status: res.status,
    statusText: res.statusText,
    headers,
  });
}

export async function OPTIONS(req: Request) {
  return withCors(
    new Response(null, { status: 204 }),
    req.headers.get("origin"),
  );
}

export async function GET(req: Request) {
  return withCors(await handlers.GET(req), req.headers.get("origin"));
}

export async function POST(req: Request) {
  return withCors(await handlers.POST(req), req.headers.get("origin"));
}
