(module
  (type $t0 (func (param i32 i32 i32 i32) (result i32)))
  (type $t1 (func (param i32 i32)))
  (type $t2 (func (result i32)))
  (type $t3 (func (param i32)))
  (type $t4 (func))
  (type $t5 (func (param i32) (result i32)))
  (type $t6 (func (param i32 i32) (result i32)))
  (type $t7 (func (param i32 i32 i32 i32)))
  (type $t8 (func (param i32 i32 i32 i32 i32) (result i32)))
  (type $t9 (func (param i32 i32 i32 i32 i32)))
  (import "arduino" "getPinLED" (func $arduino.getPinLED (type $t2)))
  (import "arduino" "pinMode" (func $arduino.pinMode (type $t1)))
  (import "rtc" "getHour" (func $rtc.getHour (type $t2)))
  (import "rtc" "getMinute" (func $rtc.getMinute (type $t2)))
  (import "rtc" "getSecond" (func $rtc.getSecond (type $t2)))
  (import "arduino" "print" (func $arduino.print (type $t1)))
  (import "u8g2" "oledClear" (func $u8g2.oledClear (type $t4)))
  (import "u8g2" "oledSetFont" (func $u8g2.oledSetFont (type $t3)))
  (import "u8g2" "oledPrint" (func $u8g2.oledPrint (type $t7)))
  (import "u8g2" "oledSendBuffer" (func $u8g2.oledSendBuffer (type $t4)))
  (import "arduino" "digitalWrite" (func $arduino.digitalWrite (type $t1)))
  (import "arduino" "delay" (func $arduino.delay (type $t3)))
  (func $f12 (type $t1) (param $p0 i32) (param $p1 i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i32) (local $l11 i64)
    block $B0
      block $B1
        local.get $p1
        i32.const 99
        i32.le_u
        if $I2
          local.get $p1
          i32.const 2048
          i32.add
          local.get $p1
          i32.const 1
          i32.shl
          i32.const 2084
          i32.add
          local.get $p1
          i32.const 10
          i32.lt_u
          local.tee $l3
          select
          local.set $p1
          i32.const 1
          i32.const 2
          local.get $l3
          select
          local.set $l3
          br $B1
        end
        local.get $p1
        i64.extend_i32_s
        local.tee $l11
        local.get $l11
        i64.const 63
        i64.shr_s
        local.tee $l11
        i64.add
        local.get $l11
        i64.xor
        local.set $l11
        i32.const 65
        local.set $l4
        i32.const 65
        call $f13
        local.tee $l6
        i32.const 2
        i32.sub
        local.set $l7
        loop $L3
          local.get $l11
          i64.const 1000000000
          i64.ge_u
          if $I4
            local.get $l4
            local.get $l7
            i32.add
            local.set $l5
            local.get $l11
            local.get $l11
            i64.const 1000000000
            i64.div_u
            local.tee $l11
            i64.const -1000000000
            i64.mul
            i64.add
            i32.wrap_i64
            local.set $l3
            i32.const 0
            local.set $l2
            loop $L5
              local.get $l2
              i32.const -8
              i32.ne
              if $I6
                local.get $l2
                local.get $l4
                i32.add
                local.tee $l8
                i32.const 1
                i32.sub
                i32.const 64
                i32.gt_u
                br_if $B0
                local.get $l2
                local.get $l5
                i32.add
                local.tee $l9
                i32.const 1
                i32.add
                local.get $l3
                local.get $l3
                i32.const 100
                i32.div_u
                local.tee $l3
                i32.const 100
                i32.mul
                i32.sub
                i32.const 1
                i32.shl
                local.tee $l10
                i32.const 1
                i32.or
                i32.const 2084
                i32.add
                i32.load8_u
                i32.store8
                local.get $l8
                i32.const 2
                i32.sub
                i32.const 64
                i32.gt_u
                br_if $B0
                local.get $l9
                local.get $l10
                i32.const 2084
                i32.add
                i32.load8_u
                i32.store8
                local.get $l2
                i32.const 2
                i32.sub
                local.set $l2
                br $L5
              end
            end
            local.get $l2
            local.get $l4
            i32.add
            i32.const 1
            i32.sub
            local.tee $l4
            i32.const 64
            i32.gt_u
            br_if $B0
            local.get $l3
            i32.const 1
            i32.shl
            i32.const 1
            i32.or
            local.tee $l3
            i32.const 199
            i32.gt_u
            br_if $B0
            local.get $l2
            local.get $l5
            i32.add
            i32.const 1
            i32.add
            local.get $l3
            i32.const 2084
            i32.add
            i32.load8_u
            i32.store8
            br $L3
          end
        end
        local.get $l4
        i32.const 1
        i32.sub
        local.set $l2
        local.get $l11
        i32.wrap_i64
        local.set $l3
        loop $L7
          local.get $l3
          i32.const 100
          i32.ge_u
          if $I8
            local.get $l2
            i32.const 64
            i32.gt_u
            br_if $B0
            local.get $l2
            local.get $l6
            i32.add
            local.tee $l4
            local.get $l3
            local.get $l3
            i32.const 100
            i32.div_u
            local.tee $l3
            i32.const 100
            i32.mul
            i32.sub
            i32.const 1
            i32.shl
            local.tee $l5
            i32.const 1
            i32.or
            i32.const 2084
            i32.add
            i32.load8_u
            i32.store8
            local.get $l2
            i32.const 1
            i32.sub
            i32.const 64
            i32.gt_u
            br_if $B0
            local.get $l4
            i32.const 1
            i32.sub
            local.get $l5
            i32.const 2084
            i32.add
            i32.load8_u
            i32.store8
            local.get $l2
            i32.const 2
            i32.sub
            local.set $l2
            br $L7
          end
        end
        local.get $l2
        i32.const 64
        i32.gt_u
        br_if $B0
        local.get $l2
        local.get $l6
        i32.add
        local.tee $l4
        local.get $l3
        i32.const 1
        i32.shl
        local.tee $l5
        i32.const 1
        i32.or
        i32.const 2084
        i32.add
        i32.load8_u
        i32.store8
        local.get $l3
        i32.const 10
        i32.ge_u
        if $I9
          local.get $l2
          i32.const 1
          i32.sub
          local.tee $l2
          i32.const 64
          i32.gt_u
          br_if $B0
          local.get $l4
          i32.const 1
          i32.sub
          local.get $l5
          i32.const 2084
          i32.add
          i32.load8_u
          i32.store8
        end
        local.get $p1
        i32.const 0
        i32.lt_s
        if $I10
          local.get $l2
          i32.const 1
          i32.sub
          local.tee $l2
          i32.const 64
          i32.gt_u
          br_if $B0
          local.get $l2
          local.get $l6
          i32.add
          i32.const 45
          i32.store8
        end
        i32.const 65
        local.get $l2
        i32.sub
        local.tee $l3
        call $f13
        local.tee $p1
        local.get $l2
        local.get $l6
        i32.add
        local.get $l3
        memory.copy
      end
      local.get $p0
      local.get $l3
      i32.store offset=4
      local.get $p0
      local.get $p1
      i32.store
      return
    end
    unreachable)
  (func $f13 (type $t5) (param $p0 i32) (result i32)
    (local $l1 i32) (local $l2 i32) (local $l3 i32)
    i32.const 2344
    i32.const 2344
    i64.load
    i64.const 1
    i64.add
    i64.store
    i32.const 2292
    i32.const 2292
    i32.load
    local.tee $l1
    local.get $p0
    i32.const 15
    i32.add
    i32.const -16
    i32.and
    local.tee $l2
    i32.add
    local.tee $p0
    i32.store
    i32.const 2336
    i32.const 2336
    i64.load
    local.get $l2
    i64.extend_i32_u
    i64.add
    i64.store
    i32.const 2328
    i32.load
    local.set $l3
    block $B0
      loop $L1
        local.get $p0
        local.get $l3
        i32.lt_u
        br_if $B0
        memory.size
        memory.grow
        i32.const -1
        i32.ne
        if $I2
          i32.const 2328
          memory.size
          i32.const 16
          i32.shl
          local.tee $l3
          i32.store
          i32.const 2292
          i32.load
          local.set $p0
          br $L1
        end
      end
      unreachable
    end
    local.get $l1
    i32.const 0
    local.get $l2
    memory.fill
    local.get $l1)
  (func $f14 (type $t0) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32) (result i32)
    (local $l4 i32)
    loop $L0
      local.get $l4
      local.tee $p3
      local.get $p2
      i32.ne
      if $I1
        local.get $p3
        i32.const 1
        i32.add
        local.set $l4
        local.get $p0
        local.get $p3
        i32.add
        i32.load8_u
        local.get $p1
        local.get $p3
        i32.add
        i32.load8_u
        i32.eq
        br_if $L0
      end
    end
    local.get $p2
    local.get $p3
    i32.le_u)
  (func $f15 (type $t0) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32) (result i32)
    local.get $p2
    i32.const -2128831035
    i32.mul
    local.set $p2
    loop $L0
      local.get $p1
      if $I1
        local.get $p1
        i32.const 1
        i32.sub
        local.set $p1
        local.get $p2
        local.get $p0
        i32.load8_u
        i32.xor
        i32.const 16777619
        i32.mul
        local.set $p2
        local.get $p0
        i32.const 1
        i32.add
        local.set $p0
        br $L0
      end
    end
    local.get $p2)
  (func $f16 (type $t5) (param $p0 i32) (result i32)
    (local $l1 i32) (local $l2 i32)
    global.get $g0
    i32.const 16
    i32.sub
    local.tee $l1
    global.set $g0
    block $B0
      local.get $p0
      i32.const 0
      i32.lt_s
      br_if $B0
      local.get $p0
      call $f13
      local.set $l2
      local.get $p0
      i32.eqz
      br_if $B0
      local.get $l1
      local.get $p0
      i32.store offset=8
      local.get $l1
      local.get $p0
      i32.store offset=4
      local.get $l1
      local.get $l2
      i32.store
      local.get $l1
      local.get $l2
      i32.store offset=12
      local.get $l1
      i32.const 12
      i32.add
      local.get $l1
      call $f17
      local.get $l1
      i32.const 16
      i32.add
      global.set $g0
      local.get $l2
      return
    end
    unreachable)
  (func $f17 (type $t1) (param $p0 i32) (param $p1 i32)
    i32.const 2296
    local.get $p0
    local.get $p1
    local.get $p0
    i32.const 2308
    i32.load8_u
    i32.const 2300
    i32.load
    local.get $p0
    call $f15
    call $f18)
  (func $f18 (type $t7) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32)
    (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i32) (local $l11 i32) (local $l12 i32) (local $l13 i32) (local $l14 i32) (local $l15 i32) (local $l16 i32) (local $l17 i32) (local $l18 i32) (local $l19 i32)
    global.get $g0
    i32.const 32
    i32.sub
    local.tee $l5
    global.set $g0
    block $B0
      block $B1
        local.get $p0
        i32.eqz
        br_if $B1
        block $B2
          local.get $p0
          i32.load8_u offset=14
          local.tee $l4
          i32.const 29
          i32.gt_u
          br_if $B2
          local.get $p0
          i32.load offset=8
          i32.const 6
          local.get $l4
          i32.shl
          i32.le_u
          br_if $B2
          i32.const 2288
          i32.const 2288
          i32.load
          local.tee $p3
          i32.const 7
          i32.shl
          local.get $p3
          i32.xor
          local.tee $p3
          i32.const 1
          i32.shr_u
          local.get $p3
          i32.xor
          local.tee $p3
          i32.const 9
          i32.shl
          local.get $p3
          i32.xor
          local.tee $p3
          i32.store
          local.get $l5
          i64.const 0
          i64.store offset=8
          local.get $l5
          local.get $p0
          i64.load offset=24 align=4
          i64.store offset=24
          local.get $l5
          local.get $p0
          i64.load offset=16 align=4
          i64.store offset=16
          local.get $l5
          local.get $p0
          i32.load16_u offset=12
          i32.store16 offset=12
          local.get $l5
          i32.const 0
          i32.store offset=8
          local.get $l5
          local.get $p3
          i32.store offset=4
          local.get $l5
          local.get $l4
          i32.const 1
          i32.add
          local.tee $p3
          i32.store8 offset=14
          local.get $l5
          local.get $p0
          i32.load8_u offset=13
          local.get $p0
          i32.load8_u offset=12
          i32.add
          i32.const 3
          i32.shl
          i32.const 12
          i32.add
          local.get $p3
          i32.shl
          call $f13
          i32.store
          local.get $p0
          i32.load8_u offset=12
          call $f13
          local.set $l6
          local.get $p0
          i32.load8_u offset=13
          call $f13
          local.set $l11
          i32.const 0
          local.set $l4
          i32.const 0
          local.set $p3
          loop $L3
            local.get $l7
            i32.eqz
            if $I4
              i32.const 1
              local.get $p0
              i32.load8_u offset=14
              local.tee $l7
              i32.shl
              i32.const 0
              local.get $l7
              i32.const 31
              i32.le_u
              select
              local.tee $l8
              i32.const 24
              i32.shr_u
              local.set $l18
              local.get $l8
              i32.const 16
              i32.shr_u
              local.set $l17
              local.get $l8
              i32.const 8
              i32.shr_u
              local.set $l14
              local.get $p0
              i32.load
              local.set $l7
            end
            local.get $l8
            i32.const 255
            i32.and
            local.get $l18
            i32.const 24
            i32.shl
            local.get $l17
            i32.const 255
            i32.and
            i32.const 16
            i32.shl
            i32.or
            local.get $l14
            i32.const 255
            i32.and
            i32.const 8
            i32.shl
            i32.or
            i32.or
            local.set $l19
            block $B5
              loop $L6
                local.get $p3
                i32.const 255
                i32.and
                i32.const 8
                i32.ge_u
                if $I7
                  local.get $l4
                  i32.eqz
                  br_if $B1
                  local.get $l4
                  i32.load offset=8
                  local.set $l4
                  i32.const 0
                  local.set $p3
                end
                local.get $l4
                i32.eqz
                if $I8
                  local.get $l10
                  i32.const 255
                  i32.and
                  local.get $l15
                  i32.const 255
                  i32.and
                  i32.const 16
                  i32.shl
                  local.get $l12
                  i32.const 24
                  i32.shl
                  i32.or
                  local.get $l16
                  i32.const 255
                  i32.and
                  i32.const 8
                  i32.shl
                  i32.or
                  i32.or
                  local.tee $l4
                  local.get $l19
                  i32.ge_u
                  br_if $B5
                  local.get $l7
                  i32.eqz
                  br_if $B1
                  local.get $l4
                  i32.const 1
                  i32.add
                  local.tee $l10
                  i32.const 24
                  i32.shr_u
                  local.set $l12
                  local.get $l10
                  i32.const 16
                  i32.shr_u
                  local.set $l15
                  local.get $l10
                  i32.const 8
                  i32.shr_u
                  local.set $l16
                  local.get $l7
                  local.get $p0
                  i32.load8_u offset=13
                  local.get $p0
                  i32.load8_u offset=12
                  i32.add
                  i32.const 3
                  i32.shl
                  i32.const 12
                  i32.add
                  local.get $l4
                  i32.mul
                  i32.add
                  local.set $l4
                end
                local.get $l4
                local.get $p3
                i32.const 255
                i32.and
                local.tee $l13
                i32.add
                i32.load8_u
                i32.eqz
                if $I9
                  local.get $p3
                  i32.const 1
                  i32.add
                  local.set $p3
                  br $L6
                end
                local.get $l6
                local.get $p0
                i32.load8_u offset=12
                local.tee $l9
                local.get $l13
                i32.mul
                local.get $l4
                i32.add
                i32.const 12
                i32.add
                local.get $l9
                memory.copy
                block $B10
                  local.get $p0
                  i32.load
                  local.get $l7
                  i32.eq
                  if $I11
                    local.get $l11
                    local.get $l13
                    local.get $p0
                    i32.load8_u offset=13
                    local.tee $l13
                    i32.mul
                    local.get $l9
                    i32.const 3
                    i32.shl
                    i32.add
                    local.get $l4
                    i32.add
                    i32.const 12
                    i32.add
                    local.get $l13
                    memory.copy
                    local.get $p3
                    i32.const 1
                    i32.add
                    local.set $p3
                    br $B10
                  end
                  local.get $p0
                  i32.load offset=28
                  local.tee $l13
                  i32.eqz
                  br_if $B1
                  local.get $p3
                  i32.const 1
                  i32.add
                  local.set $p3
                  local.get $l6
                  local.get $l9
                  local.get $p0
                  i32.load offset=4
                  local.get $p0
                  i32.load offset=24
                  local.get $l13
                  call_indirect $T0 (type $t0)
                  local.set $l9
                  local.get $p0
                  local.get $l6
                  local.get $l11
                  local.get $p0
                  i32.load8_u offset=13
                  local.get $l9
                  call $f19
                  i32.const 1
                  i32.and
                  i32.eqz
                  br_if $L6
                end
              end
              local.get $l5
              i32.load offset=28
              local.tee $l9
              i32.eqz
              br_if $B1
              local.get $l5
              local.get $l6
              local.get $l11
              local.get $l6
              local.get $l5
              i32.load8_u offset=12
              local.get $l5
              i32.load offset=4
              local.get $l5
              i32.load offset=24
              local.get $l9
              call_indirect $T0 (type $t0)
              call $f18
              br $L3
            end
          end
          local.get $p0
          local.get $l5
          i32.load
          i32.store
          local.get $p0
          local.get $l5
          i64.load offset=4 align=4
          i64.store offset=4 align=4
          local.get $p0
          local.get $l5
          i32.load8_u offset=12
          i32.store8 offset=12
          local.get $p0
          local.get $l5
          i32.load16_u offset=13 align=1
          i32.store16 offset=13 align=1
          local.get $p0
          local.get $l5
          i64.load offset=16
          i64.store offset=16 align=4
          local.get $p0
          local.get $l5
          i64.load offset=24
          i64.store offset=24 align=4
          local.get $p0
          i32.load offset=28
          local.tee $p3
          i32.eqz
          br_if $B1
          local.get $p1
          local.get $p0
          i32.load8_u offset=12
          local.get $p0
          i32.load offset=4
          local.get $p0
          i32.load offset=24
          local.get $p3
          call_indirect $T0 (type $t0)
          local.set $p3
          local.get $p0
          i32.load8_u offset=14
          local.set $l4
        end
        local.get $p0
        i32.load
        local.get $p0
        i32.load8_u offset=13
        local.get $p0
        i32.load8_u offset=12
        i32.add
        i32.const 3
        i32.shl
        i32.const 12
        i32.add
        i32.const -1
        i32.const -1
        local.get $l4
        i32.const 255
        i32.and
        local.tee $l6
        i32.shl
        i32.const -1
        i32.xor
        local.get $l6
        i32.const 31
        i32.gt_u
        select
        local.get $p3
        i32.and
        i32.mul
        i32.add
        local.set $l4
        local.get $p3
        i32.const 24
        i32.shr_u
        local.tee $p3
        i32.const 1
        local.get $p3
        select
        local.set $l10
        i32.const 0
        local.set $l6
        i32.const 0
        local.set $l8
        i32.const 0
        local.set $l12
        i32.const 0
        local.set $l7
        loop $L12
          local.get $l4
          local.tee $p3
          if $I13
            i32.const 0
            local.set $l4
            loop $L14
              local.get $l4
              i32.const 8
              i32.ne
              if $I15
                local.get $l4
                local.get $p0
                i32.load8_u offset=12
                local.tee $l6
                i32.mul
                local.get $p3
                i32.add
                i32.const 12
                i32.add
                local.set $l11
                local.get $l4
                local.get $p0
                i32.load8_u offset=13
                i32.mul
                local.get $l6
                i32.const 3
                i32.shl
                i32.add
                local.get $p3
                i32.add
                i32.const 12
                i32.add
                local.set $l9
                block $B16
                  local.get $p3
                  local.get $l4
                  i32.add
                  local.tee $l14
                  i32.load8_u
                  local.tee $l15
                  local.get $l10
                  i32.ne
                  br_if $B16
                  local.get $p0
                  i32.load offset=20
                  local.tee $l16
                  i32.eqz
                  br_if $B1
                  local.get $p1
                  local.get $l11
                  local.get $l6
                  local.get $p0
                  i32.load offset=16
                  local.get $l16
                  call_indirect $T0 (type $t0)
                  i32.const 1
                  i32.and
                  i32.eqz
                  br_if $B16
                  local.get $l9
                  local.get $p2
                  local.get $p0
                  i32.load8_u offset=13
                  memory.copy
                  br $B0
                end
                local.get $l7
                local.get $l14
                local.get $l8
                local.get $l15
                i32.or
                local.tee $l6
                select
                local.set $l7
                local.get $l8
                local.get $l11
                local.get $l6
                select
                local.set $l8
                local.get $l12
                local.get $l9
                local.get $l6
                select
                local.set $l12
                local.get $l4
                i32.const 1
                i32.add
                local.set $l4
                br $L14
              end
            end
            local.get $p3
            i32.load offset=8
            local.set $l4
            local.get $p3
            local.set $l6
            br $L12
          end
        end
        local.get $l8
        i32.eqz
        if $I17
          local.get $l6
          i32.eqz
          br_if $B1
          local.get $p0
          i32.load8_u offset=13
          local.get $p0
          i32.load8_u offset=12
          i32.add
          i32.const 3
          i32.shl
          i32.const 12
          i32.add
          call $f13
          local.set $p3
          local.get $p0
          local.get $p0
          i32.load offset=8
          i32.const 1
          i32.add
          i32.store offset=8
          local.get $p3
          i32.const 12
          i32.add
          local.get $p1
          local.get $p0
          i32.load8_u offset=12
          local.tee $p1
          memory.copy
          local.get $p3
          local.get $p1
          i32.const 3
          i32.shl
          i32.add
          i32.const 12
          i32.add
          local.get $p2
          local.get $p0
          i32.load8_u offset=13
          memory.copy
          local.get $p3
          local.get $l10
          i32.store8
          local.get $l6
          local.get $p3
          i32.store offset=8
          br $B0
        end
        local.get $p0
        local.get $p0
        i32.load offset=8
        i32.const 1
        i32.add
        i32.store offset=8
        local.get $l8
        local.get $p1
        local.get $p0
        i32.load8_u offset=12
        memory.copy
        local.get $l12
        local.get $p2
        local.get $p0
        i32.load8_u offset=13
        memory.copy
        local.get $l7
        i32.eqz
        br_if $B1
        local.get $l7
        local.get $l10
        i32.store8
        br $B0
      end
      unreachable
    end
    local.get $l5
    i32.const 32
    i32.add
    global.set $g0)
  (func $f19 (type $t8) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32) (param $p4 i32) (result i32)
    (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32)
    local.get $p0
    i32.eqz
    if $I0
      local.get $p2
      i32.const 0
      local.get $p3
      memory.fill
      i32.const 0
      return
    end
    local.get $p0
    i32.load
    local.get $p0
    i32.load8_u offset=13
    local.get $p0
    i32.load8_u offset=12
    i32.add
    i32.const 3
    i32.shl
    i32.const 12
    i32.add
    i32.const -1
    i32.const -1
    local.get $p0
    i32.load8_u offset=14
    local.tee $p3
    i32.shl
    i32.const -1
    i32.xor
    local.get $p3
    i32.const 31
    i32.gt_u
    select
    local.get $p4
    i32.and
    i32.mul
    i32.add
    local.set $p3
    local.get $p4
    i32.const 24
    i32.shr_u
    local.tee $p4
    i32.const 1
    local.get $p4
    select
    local.set $l6
    block $B1
      loop $L2
        local.get $p3
        if $I3
          i32.const 0
          local.set $p4
          loop $L4
            local.get $p4
            i32.const 8
            i32.ne
            if $I5
              block $B6
                local.get $p3
                local.get $p4
                i32.add
                i32.load8_u
                local.get $l6
                i32.ne
                br_if $B6
                local.get $p0
                i32.load offset=20
                local.tee $l7
                i32.eqz
                br_if $B1
                local.get $p0
                i32.load8_u offset=13
                local.set $l8
                local.get $p1
                local.get $p4
                local.get $p0
                i32.load8_u offset=12
                local.tee $l5
                i32.mul
                local.get $p3
                i32.add
                i32.const 12
                i32.add
                local.get $l5
                local.get $p0
                i32.load offset=16
                local.get $l7
                call_indirect $T0 (type $t0)
                i32.const 1
                i32.and
                i32.eqz
                br_if $B6
                local.get $p2
                local.get $p4
                local.get $l8
                i32.mul
                local.get $l5
                i32.const 3
                i32.shl
                i32.add
                local.get $p3
                i32.add
                i32.const 12
                i32.add
                local.get $p0
                i32.load8_u offset=13
                memory.copy
                i32.const 1
                return
              end
              local.get $p4
              i32.const 1
              i32.add
              local.set $p4
              br $L4
            end
          end
          local.get $p3
          i32.load offset=8
          local.set $p3
          br $L2
        end
      end
      local.get $p2
      i32.const 0
      local.get $p0
      i32.load8_u offset=13
      memory.fill
      i32.const 0
      return
    end
    unreachable)
  (func $f20 (type $t6) (param $p0 i32) (param $p1 i32) (result i32)
    i32.const 2296
    local.get $p0
    local.get $p1
    i32.const 12
    local.get $p0
    i32.const 2308
    i32.load8_u
    i32.const 2300
    i32.load
    local.get $p0
    call $f15
    call $f19)
  (func $f21 (type $t3) (param $p0 i32)
    (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32)
    local.get $p0
    i32.const 2308
    i32.load8_u
    local.tee $l1
    i32.const 2300
    i32.load
    local.get $l1
    call $f15
    local.tee $l2
    i32.const 24
    i32.shr_u
    local.tee $l3
    i32.const 1
    local.get $l3
    select
    local.set $l3
    i32.const 2296
    i32.load
    i32.const 2309
    i32.load8_u
    local.get $l1
    i32.add
    i32.const 3
    i32.shl
    i32.const 12
    i32.add
    i32.const -1
    i32.const -1
    i32.const 2310
    i32.load8_u
    local.tee $l1
    i32.shl
    i32.const -1
    i32.xor
    local.get $l1
    i32.const 31
    i32.gt_u
    select
    local.get $l2
    i32.and
    i32.mul
    i32.add
    local.set $l1
    block $B0
      loop $L1
        local.get $l1
        i32.eqz
        br_if $B0
        i32.const 0
        local.set $l2
        block $B2
          loop $L3
            local.get $l2
            i32.const 8
            i32.ne
            if $I4
              block $B5
                local.get $l1
                local.get $l2
                i32.add
                local.tee $l4
                i32.load8_u
                local.get $l3
                i32.ne
                br_if $B5
                i32.const 2316
                i32.load
                local.tee $l5
                i32.eqz
                br_if $B2
                local.get $p0
                local.get $l2
                i32.const 2308
                i32.load8_u
                local.tee $l6
                i32.mul
                local.get $l1
                i32.add
                i32.const 12
                i32.add
                local.get $l6
                i32.const 2312
                i32.load
                local.get $l5
                call_indirect $T0 (type $t0)
                i32.const 1
                i32.and
                i32.eqz
                br_if $B5
                local.get $l4
                i32.const 0
                i32.store8
                i32.const 2304
                i32.const 2304
                i32.load
                i32.const 1
                i32.sub
                i32.store
                br $B0
              end
              local.get $l2
              i32.const 1
              i32.add
              local.set $l2
              br $L3
            end
          end
          local.get $l1
          i32.load offset=8
          local.set $l1
          br $L1
        end
      end
      unreachable
    end)
  (func $f22 (type $t9) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32) (param $p4 i32)
    (local $l5 i32) (local $l6 i32)
    block $B0
      local.get $p2
      i32.eqz
      if $I1
        local.get $p3
        local.set $l5
        local.get $p4
        local.set $l6
        br $B0
      end
      local.get $p4
      i32.eqz
      if $I2
        local.get $p1
        local.set $l5
        local.get $p2
        local.set $l6
        br $B0
      end
      local.get $p2
      local.get $p4
      i32.add
      local.tee $l6
      call $f13
      local.tee $l5
      local.get $p1
      local.get $p2
      memory.copy
      local.get $p2
      local.get $l5
      i32.add
      local.get $p3
      local.get $p4
      memory.copy
    end
    local.get $p0
    local.get $l6
    i32.store offset=4
    local.get $p0
    local.get $l5
    i32.store)
  (func $malloc (type $t5) (param $p0 i32) (result i32)
    local.get $p0
    call $f16)
  (func $free (type $t3) (param $p0 i32)
    (local $l1 i32)
    global.get $g0
    i32.const 16
    i32.sub
    local.tee $l1
    global.set $g0
    block $B0
      block $B1
        local.get $p0
        if $I2
          local.get $l1
          local.get $p0
          i32.store offset=12
          local.get $l1
          i32.const 12
          i32.add
          local.get $l1
          call $f20
          i32.const 1
          i32.and
          i32.eqz
          br_if $B1
          local.get $l1
          local.get $p0
          i32.store
          local.get $l1
          call $f21
        end
        local.get $l1
        i32.const 16
        i32.add
        global.set $g0
        br $B0
      end
      unreachable
    end)
  (func $calloc (type $t6) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p0
    local.get $p1
    i32.mul
    call $f16)
  (func $realloc (type $t6) (param $p0 i32) (param $p1 i32) (result i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32)
    block $B0 (result i32)
      global.get $g0
      i32.const 16
      i32.sub
      local.tee $l2
      global.set $g0
      block $B1
        local.get $p1
        i32.const 0
        i32.lt_s
        br_if $B1
        local.get $p1
        call $f13
        local.set $l3
        local.get $p0
        if $I2
          local.get $l2
          local.get $p0
          i32.store offset=12
          local.get $l2
          i32.const 12
          i32.add
          local.get $l2
          call $f20
          i32.const 1
          i32.and
          i32.eqz
          br_if $B1
          local.get $l3
          local.get $l2
          i32.load
          local.get $p1
          local.get $l2
          i32.load offset=4
          local.tee $l4
          local.get $p1
          local.get $l4
          i32.lt_u
          select
          memory.copy
          local.get $l2
          local.get $p0
          i32.store
          local.get $l2
          call $f21
        end
        local.get $p1
        i32.eqz
        br_if $B1
        local.get $l2
        local.get $p1
        i32.store offset=8
        local.get $l2
        local.get $p1
        i32.store offset=4
        local.get $l2
        local.get $l3
        i32.store
        local.get $l2
        local.get $l3
        i32.store offset=12
        local.get $l2
        i32.const 12
        i32.add
        local.get $l2
        call $f17
        local.get $l2
        i32.const 16
        i32.add
        global.set $g0
        local.get $l3
        br $B0
      end
      unreachable
    end)
  (func $_start (type $t4)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32)
    i32.const 2328
    memory.size
    i32.const 16
    i32.shl
    i32.store
    i32.const 2292
    i32.const 2640
    i32.store
    i32.const 2328
    memory.size
    i32.const 16
    i32.shl
    i32.store
    i32.const 2632
    call $arduino.getPinLED
    i32.store
    global.get $g0
    i32.const 96
    i32.sub
    local.tee $l0
    global.set $g0
    i32.const 2632
    i32.load
    i32.const 1
    call $arduino.pinMode
    loop $L0
      call $rtc.getHour
      local.set $l1
      call $rtc.getMinute
      local.set $l2
      call $rtc.getSecond
      local.set $l4
      local.get $l0
      i32.const 88
      i32.add
      local.get $l1
      call $f12
      local.get $l0
      i32.const 80
      i32.add
      local.get $l0
      i32.load offset=88
      local.get $l0
      i32.load offset=92
      i32.const 2285
      i32.const 1
      call $f22
      local.get $l0
      i32.load offset=84
      local.set $l1
      local.get $l0
      i32.load offset=80
      local.set $l3
      local.get $l0
      i32.const 72
      i32.add
      local.get $l2
      call $f12
      local.get $l0
      i32.const -64
      i32.sub
      local.get $l3
      local.get $l1
      local.get $l0
      i32.load offset=72
      local.get $l0
      i32.load offset=76
      call $f22
      local.get $l0
      i32.const 56
      i32.add
      local.get $l0
      i32.load offset=64
      local.get $l0
      i32.load offset=68
      i32.const 2285
      i32.const 1
      call $f22
      local.get $l0
      i32.load offset=60
      local.set $l1
      local.get $l0
      i32.load offset=56
      local.set $l3
      local.get $l0
      i32.const 48
      i32.add
      local.get $l4
      call $f12
      local.get $l0
      i32.const 40
      i32.add
      local.get $l3
      local.get $l1
      local.get $l0
      i32.load offset=48
      local.get $l0
      i32.load offset=52
      call $f22
      local.get $l0
      i32.const 32
      i32.add
      local.get $l0
      i32.load offset=40
      local.get $l0
      i32.load offset=44
      i32.const 2284
      i32.const 1
      call $f22
      local.get $l0
      i32.load offset=32
      local.get $l0
      i32.load offset=36
      call $arduino.print
      call $u8g2.oledClear
      i32.const 0
      call $u8g2.oledSetFont
      local.get $l0
      i32.const 24
      i32.add
      local.get $l2
      call $f12
      local.get $l0
      i32.const 16
      i32.add
      local.get $l0
      i32.load offset=24
      local.get $l0
      i32.load offset=28
      i32.const 2285
      i32.const 1
      call $f22
      local.get $l0
      i32.load offset=20
      local.set $l2
      local.get $l0
      i32.load offset=16
      local.set $l1
      local.get $l0
      i32.const 8
      i32.add
      local.get $l4
      call $f12
      local.get $l0
      local.get $l1
      local.get $l2
      local.get $l0
      i32.load offset=8
      local.get $l0
      i32.load offset=12
      call $f22
      i32.const 0
      i32.const 63
      local.get $l0
      i32.load
      local.get $l0
      i32.load offset=4
      call $u8g2.oledPrint
      call $u8g2.oledSendBuffer
      i32.const 2632
      i32.load
      i32.const 1
      call $arduino.digitalWrite
      i32.const 100
      call $arduino.delay
      i32.const 2632
      i32.load
      i32.const 0
      call $arduino.digitalWrite
      i32.const 100
      call $arduino.delay
      br $L0
    end
    unreachable)
  (table $T0 3 3 funcref)
  (memory $memory 1 1)
  (global $g0 (mut i32) (i32.const 2048))
  (export "memory" (memory $memory))
  (export "malloc" (func $malloc))
  (export "free" (func $free))
  (export "calloc" (func $calloc))
  (export "realloc" (func $realloc))
  (export "_start" (func $_start))
  (elem $e0 (i32.const 1) func $f14 $f15)
  (data $d0 (i32.const 2048) "0123456789abcdefghijklmnopqrstuvwxyz00010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899\0a:")
  (data $d1 (i32.const 2288) "\c1\82\01\00P\0a\00\000\09\00\00\c1\82\01\00\00\00\00\00\04\0c\01\00\00\00\00\00\01\00\00\00\00\00\00\00\02"))
