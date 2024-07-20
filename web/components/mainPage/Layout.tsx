import Navbar from './Navbar';
import Header from './Header';
import Footer from './Footer';

export default function RootLayout({children}: {children: React.ReactNode;}) {

    return (
        <>
            <Navbar />
            <Header />
            {children} 
            <Footer />
        </>
    );
}