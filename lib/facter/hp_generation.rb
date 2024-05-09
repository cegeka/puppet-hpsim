Facter.add(:is_hp_gen10) do
  setcode do
    Facter::Core::Execution.execute('cat /sys/devices/virtual/dmi/id/product_name').include? "Gen10"
  end
end

Facter.add(:is_hp_gen9) do
  setcode do
    Facter::Core::Execution.execute('cat /sys/devices/virtual/dmi/id/product_name').lines.first.end_with? " Gen9"
  end
end

Facter.add(:is_hp_gen8) do
  setcode do
    Facter::Core::Execution.execute('cat /sys/devices/virtual/dmi/id/product_name').lines.first.end_with? " Gen8"
  end
end

Facter.add(:is_hp_gen7) do
  setcode do
    Facter::Core::Execution.execute('cat /sys/devices/virtual/dmi/id/product_name').lines.first.end_with? " G7"
  end
end
