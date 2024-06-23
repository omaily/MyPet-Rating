import type { AppProps } from 'next/app';
import RootLayout from '@/components/Layout';
import Head from 'next/head'
import "@/styles/global.css";

const MyApp = ({ Component, pageProps }: AppProps) => (
    <RootLayout>
        <Head>
            <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet" />
            <title>Rating</title>
        </Head>
        <main>
            <Component {...pageProps} />
        </main>
    </RootLayout>
);

export default MyApp;