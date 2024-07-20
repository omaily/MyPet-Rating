import {useRouter} from 'next/router'; 
import styleMain from '@/styles/Main.module.css'

const Header = () => {
    const {pathname} = useRouter();
    return (
        <p className={styleMain.mainContent}>{pathname}</p>
    );
}

export default Header;