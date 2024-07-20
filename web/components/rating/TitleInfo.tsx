import Heading from "../Heading";
import {Title} from "@/model/Title"

const ContactInfo = ({manga}:{manga:Title}) => {
  return (
    <>
      <Heading text="Title = " textP={manga.title} />
      <div>
        <strong>Email: </strong>
        {manga.rating}
      </div>
      <div>
        <strong>Address: </strong>
      </div>
    </>
  );
}

export default ContactInfo;