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
    username
} from "better-auth/plugins";
import Database from "better-sqlite3";

export const auth = betterAuth({
    advanced: {
        cookiePrefix: "expense-manager",

        useSecureCookies: false, // Ensure this matches your dev env (http vs https)
        cookies: {
            "expense-manager.session_token": {
                attributes: {
                    httpOnly: false,
                    sameSite: "none", // Required for cross-site auth flows
                    secure: true, // Required if SameSite=None
                }
            },
            state: {
                attributes: {
                    httpOnly: true, // State cookie doesn't need to be JS accessible
                    sameSite: "none", // CRITICAL: Allows cookie to be sent on redirect from Provider
                    secure: true, //
                }
            }
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
    trustedOrigins: [
        "*",
        "myapp://"
    ],

    plugins: [
        nextCookies(),
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
            sendMagicLink: async (data, request) => {
                console.log("Magic link to:", data.email, "url:", data.url);
            },
        }),
        phoneNumber({
            sendOTP: ({ phoneNumber, code }, ctx) => {
                console.log("OTP sent to:", phoneNumber, "code:", code);
            }
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
    
    ],
});

