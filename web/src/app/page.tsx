"use client";

import { authClient } from "@/lib/auth-client";
import Image from "next/image";

export default function Home() {
  const { data: session, isPending } = authClient.useSession();

  return (
    <div className="flex min-h-screen items-center justify-center bg-zinc-50 font-sans dark:bg-black p-8">
      <main className="flex w-full max-w-3xl flex-col items-center gap-12 py-16 px-8 bg-white dark:bg-zinc-900 rounded-3xl shadow-xl sm:items-start transition-all border border-zinc-200 dark:border-zinc-800">
        <Image
          className="dark:invert mb-4"
          src="/next.svg"
          alt="Next.js logo"
          width={100}
          height={20}
          priority
        />
        
        <div className="flex flex-col items-center gap-6 text-center sm:items-start sm:text-left w-full">
          <h1 className="text-4xl font-bold tracking-tight text-black dark:text-zinc-50">
            Next.js + Better Auth
          </h1>
          
          <div className="w-full p-6 rounded-2xl bg-zinc-50 dark:bg-zinc-800 border border-zinc-200 dark:border-zinc-700">
            {isPending ? (
              <p className="text-zinc-500 animate-pulse">Checking session...</p>
            ) : session ? (
              <div className="flex flex-col gap-4">
                <p className="text-lg text-zinc-600 dark:text-zinc-400">
                  Welcome back, <span className="font-semibold text-zinc-900 dark:text-zinc-50">{session.user.email}</span>!
                </p>
                <button
                  onClick={async () => await authClient.signOut()}
                  className="px-6 py-2 rounded-xl bg-red-500 text-white font-medium hover:bg-red-600 transition-colors w-full sm:w-auto"
                >
                  Sign Out
                </button>
              </div>
            ) : (
              <div className="flex flex-col gap-4">
                <p className="text-lg text-zinc-600 dark:text-zinc-400">
                  You are not signed in.
                </p>
                <div className="flex flex-col gap-3">
                    <button
                        onClick={async () => {
                            await authClient.signIn.email({
                                email: "test@example.com",
                                password: "password123",
                            });
                        }}
                        className="px-6 py-3 rounded-xl bg-zinc-900 text-zinc-50 font-medium hover:bg-zinc-800 dark:bg-white dark:text-zinc-900 dark:hover:bg-zinc-200 transition-all shadow-lg hover:shadow-xl active:scale-95"
                    >
                        Sign In with Test Account
                    </button>
                    <p className="text-xs text-zinc-400">
                        Default creds: test@example.com / password123
                    </p>
                </div>
              </div>
            )}
          </div>
        </div>

        <div className="flex flex-col gap-4 text-base font-medium sm:flex-row w-full mt-8">
          <a
            className="flex h-12 flex-1 items-center justify-center gap-2 rounded-2xl bg-zinc-900 text-zinc-50 transition-all hover:bg-zinc-800 dark:bg-zinc-50 dark:text-zinc-900 dark:hover:bg-zinc-200 shadow-md"
            href="https://www.better-auth.com"
            target="_blank"
            rel="noopener noreferrer"
          >
            Better Auth Docs
          </a>
          <a
            className="flex h-12 flex-1 items-center justify-center rounded-2xl border border-zinc-200 px-5 transition-all hover:bg-zinc-100 dark:border-zinc-800 dark:hover:bg-zinc-800 shadow-sm"
            href="https://nextjs.org/docs"
            target="_blank"
            rel="noopener noreferrer"
          >
            Next.js Docs
          </a>
        </div>
      </main>
    </div>
  );
}

