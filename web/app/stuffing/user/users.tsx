// 'use client'
import React from 'react';
import axios from 'axios';
import Link from 'next/link';
import styles from './Users.module.css';
import Image, { StaticImageData } from 'next/image';
import imgGif from '../../../img/user_gifs/imgImport'

type User = {
    id: number
    avatar: number
    name: string
    numer: string
};

// function ListItem(prop:{user:User}) {  // prop.user.avatar
function ListItem({user:p}:{user:User}) {
    return(
        <div id={styles.block}>
            <div id={styles.block_inline}>
                <div id={styles.alinement_visual}>
                    <div id={styles.depart_tag}>
                        <img src="https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/apps/2022180/501d65c7429f22ba0e70862932146c0f17151f25.jpg" alt="Miss Neko 3" id={styles.IMG_30}/>
                    </div>
                    <Image src={imgGif[p.avatar]} id={styles.avatar}  alt='' />
                </div>
                <div id={styles.relation}>
                    <div id={styles.name}>
                        Иванов Б.П.
                    </div>
                    <div id={styles.number_grid}>
                        <svg width="64px" height="54px" viewBox="0 0 64 54" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M4 0C1.79086 0 0 1.79086 0 4V50C0 52.2091 1.79086 54 4 54H11H53H60C62.2091 54 64 52.2091 64 50V4C64 1.79086 62.2091 0 60 0H53H11H4ZM11 2V52H53V2H11ZM8 25H3V29.8H8V25ZM3 15H8V19.8H3V15ZM8 6H3V10.8H8V6ZM3 34.5996H8V39.3996H3V34.5996ZM8 44.2002H3V49.0002H8V44.2002ZM39.8603 17.535C39.8603 21.0291 36.8085 24.0701 32.7786 24.0701C28.7487 24.0701 25.6969 21.0291 25.6969 17.535C25.6969 14.041 28.7487 11 32.7786 11C36.8085 11 39.8603 14.041 39.8603 17.535ZM41.8603 17.535C41.8603 22.2488 37.7943 26.0701 32.7786 26.0701C27.7629 26.0701 23.6969 22.2488 23.6969 17.535C23.6969 12.8213 27.7629 9 32.7786 9C37.7943 9 41.8603 12.8213 41.8603 17.535ZM30.4484 27.5466C24.6389 27.5466 19.3689 30.9432 17.364 36.4652C16.8368 37.9173 16.3885 39.1885 16.1121 39.9794C15.773 40.9495 16.227 42.0134 17.1535 42.4456L17.9794 42.831C27.4793 47.2632 38.4824 47.1178 47.8618 42.4361C48.7479 41.9938 49.1714 40.9651 48.8535 40.0271L48.0754 37.7315C46.0118 31.6431 40.2979 27.5466 33.8692 27.5466H33.0013H30.4484ZM19.2439 37.1478C20.9397 32.4771 25.4141 29.5466 30.4484 29.5466H33.0013H33.8692C39.4407 29.5466 44.3928 33.0969 46.1812 38.3735L46.9541 40.6538C38.1237 45.056 27.7672 45.1905 18.825 41.0185L18.0018 40.6344C18.2765 39.8484 18.7212 38.5873 19.2439 37.1478ZM61 25H56V29.8H61V25ZM56 15H61V19.8H56V15ZM61 6H56V10.8H61V6ZM56 34.5996H61V39.3996H56V34.5996ZM61 44.2002H56V49.0002H61V44.2002Z" fill=""></path>
                        </svg>
                        <div id={styles.DIV_39}>
                            +7909853****
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

// export default async function Users({department}: {department: string}) {
export default function Users({department}: {department: string}) {

    const users: User[] = [
        { id: 1, avatar: 1,  name: "Закр Б.П", numer: "ho", },
        { id: 2, avatar: 2,  name: "Гора А.С", numer: "he", },
        { id: 3, avatar: 3,  name: "Брат К.И", numer: "he", },
        { id: 4, avatar: 4,  name: "Гриш Э.С", numer: "hell", },
        { id: 5, avatar: 5,  name: "Гриш Э.С", numer: "hell", },
        { id: 6, avatar: 6,  name: "Гриш Э.С", numer: "hell", },
    ];

    const listUsers = users.map( element =>  <ListItem key={element.id} user={element}/> );

    return  ( <> {listUsers} </> );
}