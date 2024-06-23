import styleMain from "@/styles/Main.module.css"

const Heading = ({text:h, textP:p}:{text:string, textP:string}) => {
    return (
        <div className={styleMain.mainContent}>
            <h1> {h} </h1>
            <p>  {p} </p>
        </div>
    );
}

export default Heading;