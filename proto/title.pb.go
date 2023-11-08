// Code generated by protoc-gen-go. DO NOT EDIT.
// source: proto/title.proto

package manga

import (
	context "context"
	fmt "fmt"
	proto "github.com/golang/protobuf/proto"
	timestamp "github.com/golang/protobuf/ptypes/timestamp"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
	math "math"
)

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
// A compilation error at this line likely means your copy of the
// proto package needs to be updated.
const _ = proto.ProtoPackageIsVersion3 // please upgrade the proto package

type Consignment struct {
	Name                 string               `protobuf:"bytes,1,opt,name=name,proto3" json:"name,omitempty"`
	NameEng              string               `protobuf:"bytes,2,opt,name=name_eng,json=nameEng,proto3" json:"name_eng,omitempty"`
	Author               string               `protobuf:"bytes,3,opt,name=author,proto3" json:"author,omitempty"`
	DateStart            *timestamp.Timestamp `protobuf:"bytes,4,opt,name=date_start,json=dateStart,proto3" json:"date_start,omitempty"`
	DateFinish           *timestamp.Timestamp `protobuf:"bytes,5,opt,name=date_finish,json=dateFinish,proto3" json:"date_finish,omitempty"`
	Status               string               `protobuf:"bytes,6,opt,name=status,proto3" json:"status,omitempty"`
	XXX_NoUnkeyedLiteral struct{}             `json:"-"`
	XXX_unrecognized     []byte               `json:"-"`
	XXX_sizecache        int32                `json:"-"`
}

func (m *Consignment) Reset()         { *m = Consignment{} }
func (m *Consignment) String() string { return proto.CompactTextString(m) }
func (*Consignment) ProtoMessage()    {}
func (*Consignment) Descriptor() ([]byte, []int) {
	return fileDescriptor_d07a90602115ef5b, []int{0}
}

func (m *Consignment) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_Consignment.Unmarshal(m, b)
}
func (m *Consignment) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_Consignment.Marshal(b, m, deterministic)
}
func (m *Consignment) XXX_Merge(src proto.Message) {
	xxx_messageInfo_Consignment.Merge(m, src)
}
func (m *Consignment) XXX_Size() int {
	return xxx_messageInfo_Consignment.Size(m)
}
func (m *Consignment) XXX_DiscardUnknown() {
	xxx_messageInfo_Consignment.DiscardUnknown(m)
}

var xxx_messageInfo_Consignment proto.InternalMessageInfo

func (m *Consignment) GetName() string {
	if m != nil {
		return m.Name
	}
	return ""
}

func (m *Consignment) GetNameEng() string {
	if m != nil {
		return m.NameEng
	}
	return ""
}

func (m *Consignment) GetAuthor() string {
	if m != nil {
		return m.Author
	}
	return ""
}

func (m *Consignment) GetDateStart() *timestamp.Timestamp {
	if m != nil {
		return m.DateStart
	}
	return nil
}

func (m *Consignment) GetDateFinish() *timestamp.Timestamp {
	if m != nil {
		return m.DateFinish
	}
	return nil
}

func (m *Consignment) GetStatus() string {
	if m != nil {
		return m.Status
	}
	return ""
}

// Создадим пустой запрос
type GetRequest struct {
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *GetRequest) Reset()         { *m = GetRequest{} }
func (m *GetRequest) String() string { return proto.CompactTextString(m) }
func (*GetRequest) ProtoMessage()    {}
func (*GetRequest) Descriptor() ([]byte, []int) {
	return fileDescriptor_d07a90602115ef5b, []int{1}
}

func (m *GetRequest) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_GetRequest.Unmarshal(m, b)
}
func (m *GetRequest) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_GetRequest.Marshal(b, m, deterministic)
}
func (m *GetRequest) XXX_Merge(src proto.Message) {
	xxx_messageInfo_GetRequest.Merge(m, src)
}
func (m *GetRequest) XXX_Size() int {
	return xxx_messageInfo_GetRequest.Size(m)
}
func (m *GetRequest) XXX_DiscardUnknown() {
	xxx_messageInfo_GetRequest.DiscardUnknown(m)
}

var xxx_messageInfo_GetRequest proto.InternalMessageInfo

type Response struct {
	Created     bool         `protobuf:"varint,2,opt,name=created,proto3" json:"created,omitempty"`
	Consignment *Consignment `protobuf:"bytes,3,opt,name=consignment,proto3" json:"consignment,omitempty"`
	// ответное сообщение содержит запись партий
	Consignments         []*Consignment `protobuf:"bytes,4,rep,name=consignments,proto3" json:"consignments,omitempty"`
	XXX_NoUnkeyedLiteral struct{}       `json:"-"`
	XXX_unrecognized     []byte         `json:"-"`
	XXX_sizecache        int32          `json:"-"`
}

func (m *Response) Reset()         { *m = Response{} }
func (m *Response) String() string { return proto.CompactTextString(m) }
func (*Response) ProtoMessage()    {}
func (*Response) Descriptor() ([]byte, []int) {
	return fileDescriptor_d07a90602115ef5b, []int{2}
}

func (m *Response) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_Response.Unmarshal(m, b)
}
func (m *Response) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_Response.Marshal(b, m, deterministic)
}
func (m *Response) XXX_Merge(src proto.Message) {
	xxx_messageInfo_Response.Merge(m, src)
}
func (m *Response) XXX_Size() int {
	return xxx_messageInfo_Response.Size(m)
}
func (m *Response) XXX_DiscardUnknown() {
	xxx_messageInfo_Response.DiscardUnknown(m)
}

var xxx_messageInfo_Response proto.InternalMessageInfo

func (m *Response) GetCreated() bool {
	if m != nil {
		return m.Created
	}
	return false
}

func (m *Response) GetConsignment() *Consignment {
	if m != nil {
		return m.Consignment
	}
	return nil
}

func (m *Response) GetConsignments() []*Consignment {
	if m != nil {
		return m.Consignments
	}
	return nil
}

func init() {
	proto.RegisterType((*Consignment)(nil), "manga.Consignment")
	proto.RegisterType((*GetRequest)(nil), "manga.GetRequest")
	proto.RegisterType((*Response)(nil), "manga.Response")
}

func init() {
	proto.RegisterFile("proto/title.proto", fileDescriptor_d07a90602115ef5b)
}

var fileDescriptor_d07a90602115ef5b = []byte{
	// 333 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0x84, 0x51, 0x3d, 0x6f, 0xea, 0x40,
	0x10, 0x7c, 0x7e, 0x7c, 0xaf, 0x91, 0x10, 0x5b, 0x3c, 0xdd, 0xa3, 0x09, 0x72, 0x45, 0x65, 0x14,
	0x12, 0x45, 0x8a, 0x52, 0xa2, 0x84, 0xde, 0xd0, 0xa3, 0x03, 0x16, 0x73, 0x12, 0x3e, 0x3b, 0xbe,
	0x75, 0x8a, 0xfc, 0x8c, 0xfc, 0xc6, 0xfc, 0x90, 0xc8, 0x6b, 0x2c, 0x88, 0x44, 0x94, 0xca, 0x3b,
	0xbb, 0x33, 0xf6, 0xcc, 0x18, 0x86, 0x59, 0x9e, 0x72, 0x3a, 0x65, 0xc3, 0x47, 0x0a, 0x65, 0xc6,
	0x56, 0xa2, 0x6d, 0xac, 0x47, 0x37, 0x71, 0x9a, 0xc6, 0x47, 0x9a, 0xca, 0x72, 0x53, 0xec, 0xa7,
	0x6c, 0x12, 0x72, 0xac, 0x93, 0xac, 0xe2, 0x05, 0x9f, 0x1e, 0xf8, 0xf3, 0xd4, 0x3a, 0x13, 0xdb,
	0x84, 0x2c, 0x23, 0x42, 0xd3, 0xea, 0x84, 0x94, 0x37, 0xf6, 0x26, 0xbd, 0x48, 0x66, 0xfc, 0x0f,
	0xdd, 0xf2, 0xb9, 0x26, 0x1b, 0xab, 0xbf, 0xb2, 0xef, 0x94, 0xf8, 0xd9, 0xc6, 0xf8, 0x0f, 0xda,
	0xba, 0xe0, 0x43, 0x9a, 0xab, 0x86, 0x1c, 0x4e, 0x08, 0x1f, 0x01, 0x76, 0x9a, 0x69, 0xed, 0x58,
	0xe7, 0xac, 0x9a, 0x63, 0x6f, 0xe2, 0xcf, 0x46, 0x61, 0x65, 0x26, 0xac, 0xcd, 0x84, 0xab, 0xda,
	0x4c, 0xd4, 0x2b, 0xd9, 0xcb, 0x92, 0x8c, 0x4f, 0xe0, 0x8b, 0x74, 0x6f, 0xac, 0x71, 0x07, 0xd5,
	0xfa, 0x55, 0x2b, 0x5f, 0x7a, 0x11, 0x76, 0xe9, 0xc7, 0xb1, 0xe6, 0xc2, 0xa9, 0x76, 0xe5, 0xa7,
	0x42, 0x41, 0x1f, 0x60, 0x41, 0x1c, 0xd1, 0x6b, 0x41, 0x8e, 0x83, 0x0f, 0x0f, 0xba, 0x11, 0xb9,
	0x2c, 0xb5, 0x8e, 0x50, 0x41, 0x67, 0x9b, 0x93, 0x66, 0xda, 0x49, 0xb8, 0x6e, 0x54, 0x43, 0xbc,
	0x07, 0x7f, 0x7b, 0xae, 0x46, 0x12, 0xfa, 0x33, 0x0c, 0xa5, 0xd9, 0xf0, 0xa2, 0xb4, 0xe8, 0x92,
	0x86, 0x0f, 0xd0, 0xbf, 0x80, 0x4e, 0x35, 0xc7, 0x8d, 0x1f, 0x64, 0xdf, 0x78, 0xb3, 0x77, 0x18,
	0x2c, 0x0f, 0x26, 0xcb, 0x8c, 0x8d, 0x97, 0x94, 0xbf, 0x99, 0x2d, 0x95, 0x06, 0xe6, 0xe2, 0x65,
	0x55, 0xfe, 0x59, 0xbc, 0xf2, 0x8e, 0xd1, 0xe0, 0xb4, 0xab, 0xe3, 0x04, 0x7f, 0xf0, 0x16, 0x7a,
	0x0b, 0x62, 0x91, 0x38, 0x1c, 0x9e, 0xee, 0xe7, 0xf4, 0x57, 0x24, 0x9b, 0xb6, 0xd4, 0x7a, 0xf7,
	0x15, 0x00, 0x00, 0xff, 0xff, 0xa4, 0xcd, 0x28, 0xe4, 0x49, 0x02, 0x00, 0x00,
}

// Reference imports to suppress errors if they are not otherwise used.
var _ context.Context
var _ grpc.ClientConnInterface

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
const _ = grpc.SupportPackageIsVersion6

// ShippingServiceClient is the client API for ShippingService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://godoc.org/google.golang.org/grpc#ClientConn.NewStream.
type ShippingServiceClient interface {
	CreateTitle(ctx context.Context, in *Consignment, opts ...grpc.CallOption) (*Response, error)
	GetTitles(ctx context.Context, in *GetRequest, opts ...grpc.CallOption) (*Response, error)
}

type shippingServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewShippingServiceClient(cc grpc.ClientConnInterface) ShippingServiceClient {
	return &shippingServiceClient{cc}
}

func (c *shippingServiceClient) CreateTitle(ctx context.Context, in *Consignment, opts ...grpc.CallOption) (*Response, error) {
	out := new(Response)
	err := c.cc.Invoke(ctx, "/manga.ShippingService/CreateTitle", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *shippingServiceClient) GetTitles(ctx context.Context, in *GetRequest, opts ...grpc.CallOption) (*Response, error) {
	out := new(Response)
	err := c.cc.Invoke(ctx, "/manga.ShippingService/GetTitles", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// ShippingServiceServer is the server API for ShippingService service.
type ShippingServiceServer interface {
	CreateTitle(context.Context, *Consignment) (*Response, error)
	GetTitles(context.Context, *GetRequest) (*Response, error)
}

// UnimplementedShippingServiceServer can be embedded to have forward compatible implementations.
type UnimplementedShippingServiceServer struct {
}

func (*UnimplementedShippingServiceServer) CreateTitle(ctx context.Context, req *Consignment) (*Response, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CreateTitle not implemented")
}
func (*UnimplementedShippingServiceServer) GetTitles(ctx context.Context, req *GetRequest) (*Response, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetTitles not implemented")
}

func RegisterShippingServiceServer(s *grpc.Server, srv ShippingServiceServer) {
	s.RegisterService(&_ShippingService_serviceDesc, srv)
}

func _ShippingService_CreateTitle_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(Consignment)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ShippingServiceServer).CreateTitle(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/manga.ShippingService/CreateTitle",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ShippingServiceServer).CreateTitle(ctx, req.(*Consignment))
	}
	return interceptor(ctx, in, info, handler)
}

func _ShippingService_GetTitles_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ShippingServiceServer).GetTitles(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/manga.ShippingService/GetTitles",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ShippingServiceServer).GetTitles(ctx, req.(*GetRequest))
	}
	return interceptor(ctx, in, info, handler)
}

var _ShippingService_serviceDesc = grpc.ServiceDesc{
	ServiceName: "manga.ShippingService",
	HandlerType: (*ShippingServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "CreateTitle",
			Handler:    _ShippingService_CreateTitle_Handler,
		},
		{
			MethodName: "GetTitles",
			Handler:    _ShippingService_GetTitles_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "proto/title.proto",
}
