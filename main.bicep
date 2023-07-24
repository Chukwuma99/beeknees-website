param imageName string = 'chumaigwe9/bees-knee-website:1.5'
param dnsNameLabel string = 'beeskneeco'
param resourceGroupName string = 'BeesKneeGroup'

resource containerGroup 'Microsoft.ContainerInstance/containerGroups@2021-03-01' = {
  name: dnsNameLabel
  location: 'canadacentral'
  properties: {
    containers: [
      {
        name: dnsNameLabel
        properties: {
          image: imageName
          ports: [
            {
              port: 80
              protocol: 'TCP'
            }
          ]
          resources: {
            requests: {
              cpu: 1
              memoryInGB: 1
            }
          }
        }
      }
    ]
    osType: 'Linux'
    restartPolicy: 'Always'
    ipAddress: {
      ports: [
        {
          port: 80
          protocol: 'TCP'
        }
      ]
      type: 'Public'
      dnsNameLabel: dnsNameLabel
    }
  }
}
