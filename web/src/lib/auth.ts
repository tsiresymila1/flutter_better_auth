import { expo } from "@better-auth/expo";
import { passkey } from "@better-auth/passkey";
import { betterAuth } from "better-auth";
import { nextCookies } from "better-auth/next-js";
import {
    admin,
    anonymous,
    bearer,
    emailOTP,
    jwt,
    magicLink,
    multiSession,
    oneTimeToken,
    openAPI,
    organization,
    phoneNumber,
    twoFactor,
    username,
} from "better-auth/plugins";
import Database from "better-sqlite3";

export const auth = betterAuth({
    advanced: {
        cookiePrefix: "expense-manager",

        // PRODUCTION (app + server on subdomains of one root domain, e.g.
        // app.example.com + api.example.com): enable cross-subdomain cookies so
        // the session cookie is first-party for both and web social works
        // without third-party-cookie blocking. Does NOT help localhost + ngrok
        // (no shared root domain) — use a reverse proxy in dev instead.
        // crossSubDomainCookies: { enabled: true, domain: "yourdomain.com" },
        // useSecureCookies: true, // prod = https

        useSecureCookies: false, // Ensure this matches your dev env (http vs https)
        // LOCAL http (everything on localhost): Lax + non-secure so the browser
        // actually stores the state/session cookies (Secure cookies are dropped
        // on http). For a CROSS-SITE https setup (web app on a different origin
        // than the server) switch these back to `sameSite: "none", secure: true`.
        cookies: {
            "expense-manager.session_token": {
                attributes: {
                    httpOnly: false,
                    sameSite: "lax",
                    secure: false,
                },
            },
            state: {
                attributes: {
                    httpOnly: true,
                    sameSite: "lax",
                    secure: false,
                },
            },
        },
    },
    account: {
        // storeStateStrategy: "database"
        // storeAccountCookie: true,
        skipStateCookieCheck: true,
    },
    database: new Database("auth.db"),
    secret: process.env.BETTER_AUTH_SECRET,
    emailAndPassword: {
        enabled: true,
    },
    socialProviders: {
        google: {
            clientId: process.env.GOOGLE_CLIENT_ID || "PLACEHOLDER",
            clientSecret: process.env.GOOGLE_CLIENT_SECRET || "PLACEHOLDER",
        },
        github: {
            clientId: process.env.GITHUB_CLIENT_ID || "PLACEHOLDER",
            clientSecret: process.env.GITHUB_CLIENT_SECRET || "PLACEHOLDER",
        },
    },
    rateLimit: {
        enabled: true,
    },
    trustedOrigins: ["*", "myapp://","http://localhost:61938"],

    plugins: [
        jwt({
            jwks: {
                keyPairConfig: {
                    alg: "RS256",
                    modulusLength: 2048,
                },
            },
            jwt: {
                expirationTime: "7d",
            },
        }),
        twoFactor(),
        username(),
        anonymous(),
        magicLink({
            sendMagicLink: async (data) => {
                console.log("Magic link to:", data.email, "url:", data.url);
            },
        }),
        phoneNumber({
            sendOTP: ({ phoneNumber, code }) => {
                console.log("OTP sent to:", phoneNumber, "code:", code);
            },
        }),
        emailOTP({
            async sendVerificationOTP({ email, otp, type }) {
                if (type === "sign-in") {
                    console.log("OTP sent to:", email, "code:", otp);
                } else if (type === "email-verification") {
                    console.log("OTP sent to:", email, "code:", otp);
                } else {
                    console.log("OTP sent to:", email, "code:", otp);
                }
            },
        }),
        admin(),
        passkey(),
        organization(),
        bearer(),
        multiSession(),
        openAPI(),
        oneTimeToken(),
        expo(),
        nextCookies(),
    ],
});
