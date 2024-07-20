import type { AppProps } from 'next/app';
import Head from 'next/head'

import "@/styles/global.css";
import styleMain from "@/styles/Main.module.css";
import RootLayout from '@/components/mainPage/Layout';

const MyApp = ({ Component, pageProps }: AppProps) => (
    <RootLayout>
        <Head>
            <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet" />
            <title>Rating</title>
        </Head>
        <main className={styleMain.mainContent}>
            <Component {...pageProps} />
        </main>
    </RootLayout>
);

export default MyApp;