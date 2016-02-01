![haproxy](https://csphere.cn/assets/45169590-0653-4ec5-9a2e-57b4a49fea56)

## 如何使用该镜像

最强大的负载均衡 - HAProxy, 用来保障服务平稳运行

### 启动
```console
$ image=index.csphere.cn/microimages/haproxy
$ docker run --name myhaproxy -d -e PUBLIC_DOMAIN=hello.csphere.cn \
  -e APP=myapp -e SERVICE=myservice -e HOST_IP=192.168.1.100 \
  -e ADMIN_PASSWORD=mypass --cap-add=NET_ADMIN $image
```

`PUBLIC_DOMAIN`: 应用的外部域名
`APP`: csphere下应用名称
`SERVICE`: csphere下`APP`里的服务名称
`HOST_IP`: 指定主机IP
`ADMIN_PASSWORD`: 通过http://haproxy-ip/stats可以访问负载均衡统计

当服务的容器不断发生变化时，haproxy可以实时更新后端并自动reload，保证服务的平滑运行。在实际测试中100万请求过程中不断增加容器后端，没有一个请求失败。

## 授权和法律

该镜像由希云制造，未经允许，任何第三方企业和个人，不得重新分发。违者必究。

## 支持和反馈

该镜像由希云为企业客户提供技术支持和保障，任何问题都可以直接反馈到: `docker@csphere.cn`

