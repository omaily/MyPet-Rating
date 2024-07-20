const Heading = ({text:h, textP:p}:{text:string, textP:string}) => {
    return (
        <div >
            <h1> {h} </h1>
            <p>  {p} </p>
        </div>
    );
}

export default Heading;