module Devices
  class Update < Mutations::Command
    required do
      model :device, class: Device
    end

    optional do
      string  :timezone, in: Device::TIMEZONES
      string  :name
      string  :webcam_url
    end

    def execute
      device.update_attributes!(inputs.except(:device))
      device
    end
  end
end
