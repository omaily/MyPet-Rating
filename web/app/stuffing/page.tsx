'use client'
import React, { useState } from 'react';
import Link from 'next/link';

import Users from './user/users'
import styles from './Stuff.module.css';

import Image from 'next/image';
import img from "../../img/1672248167_kalix-club-p-katana-art-instagram-50.jpg";

// const ListItem = ({department}: {department: string}): React.ReactElement => (
function ListItem ({department, color}: {department: string, color:number}): React.ReactElement {

    const colors: string[] = [
        'rgba(224, 129, 253, 0.6)',
        'rgba(166, 129, 253, 0.6)',
        'rgba(129, 152, 253, 0.6)',
        'rgba(82, 161, 226, 0.6)',
        'rgba(67, 76, 206, 0.6)',
    ]

    let stylesGradient ={
        background: 'linear-gradient( transparent,'  +
               colors[color] + ' 0%, rgba(27, 27, 27, 0.9) 35%, var(--surface2) 95%)'
    }

    return (
        <article className={styles.article} >
            <div className={styles.gradient} style={stylesGradient}/>
            <Image
                alt='Mount'
                src={img}
                fill
                sizes='100vw'
                style={{
                    borderRadius: 'var(--border)',
                    zIndex: '0',
                    objectFit: 'cover', // cover, contain, none
                }}
            />
            <h1 className={styles.h1}>{department}</h1>
            <div className={styles.article_grid}>
                <Users department={department}/>
            </div>
        </article>
    );
}

export default function Stuffing() {
    // function dec2bin(dec:number) {
    //     return (dec >>> 0).toString(2);
    // }

    // useEffect (() => {
    //     const color = getComputedStyle(document.documentElement).getPropertyValue('--collor')
    // },[])

    const departments: string[] = [
        'Департамент разведки', 
        'Департамент антенн',
        'Департамент скорой помощи',
        'Департамент образования',
        'Департамент энергетики',
    ]

    const listDepartment = departments.map( (element, index) => {
        return <ListItem color={index} department={element} />
    })

    return (
        <div className={styles.content}>
            
            <aside className={styles.aside}>
                <Link href='./stuffing'>
                    Отделы: все
                </Link>
                <Link href='./stuffing'>
                    Машины
                </Link>
            </aside>

            <div style={{flexGrow: '1'}}>
                {listDepartment}
            </div>

        </div> 
    );
}