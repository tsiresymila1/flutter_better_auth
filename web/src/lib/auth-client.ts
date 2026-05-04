import { createAuthClient } from "better-auth/react";
import { 
    anonymousClient, 
    magicLinkClient, 
    twoFactorClient, 
    organizationClient, 
    adminClient, 
    multiSessionClient, 
    usernameClient 
} from "better-auth/client/plugins";
import { passkeyClient } from "@better-auth/passkey/client";

export const authClient = createAuthClient({
    baseURL: process.env.NEXT_PUBLIC_APP_URL || "http://localhost:3000",
    plugins: [
        anonymousClient(),
        magicLinkClient(),
        twoFactorClient(),
        passkeyClient(),
        organizationClient(),
        adminClient(),
        multiSessionClient(),
        usernameClient(),
    ],
});



