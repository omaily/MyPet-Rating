import Link from 'next/link';
import Router from 'next/link';
import './globals.css';

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const manga = "Manga";
  return (
    <html lang='en'>
      <body>
        <main>
          <nav>
            <Link href="/home">
              Home
            </Link>
            <Link href={{pathname: `/rating`}}>
              {manga}
            </Link>
            </nav>
          {children}
        </main>
      </body>
    </html>
  );
}