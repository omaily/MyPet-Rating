import {useRouter} from 'next/router'; 
import Link from 'next/link';
import styles from '@/styles/Main.module.css'
import styleNav from '@/styles/Navbar.module.css'

const navigation = [
    {id:1 , path:"/", title:'Home'},
    {id:2 , path:"/rating/manga", title:'Manga'},
    {id:3 , path:"/rating/anime", title:'Anime'},
    {id:4 , path:"/characters", title:'Сharacters'},
    {id:6 , path:"/login", title:'Login'}
]

const Navbar = () => {
    const {pathname} = useRouter();

    return (
        <nav className={styles.mainContent + ' ' + styleNav.navigation}>
            {navigation.map(({id, path, title}) => (
                <Link  key={id} href={path}>
                    <div className={ pathname === path ? styleNav.active : "" }>{title}</div>
                </Link>
            ))}
        </nav>
    );
}

export default Navbar;